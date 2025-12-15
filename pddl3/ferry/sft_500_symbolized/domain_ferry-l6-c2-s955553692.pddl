(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v4 ?v6)
		(pred_3 ?v1)
		(pred_5 ?v5)
		(pred_4 ?v5)
		(pred_2 ?v1 ?v5)
		(pred_1)
		(pred_6 ?v1))

   (:action op_1
       :parameters  (?v3 ?v8)
       :precondition (and (not-eq ?v3 ?v8) 
                          (pred_5 ?v3) (pred_5 ?v8) (pred_4 ?v3))
       :effect (and  (pred_4 ?v8)
		     (not (pred_4 ?v3))))


   (:action op_3
       :parameters (?v7 ?v2)
       :precondition  (and  (pred_3 ?v7) (pred_5 ?v2)
			    (pred_2 ?v7 ?v2) (pred_4 ?v2) (pred_1))
       :effect (and (pred_6 ?v7)
		    (not (pred_2 ?v7 ?v2)) 
		    (not (pred_1))))

   (:action op_2
       :parameters  (?v7  ?v2)
       :precondition  (and  (pred_3 ?v7) (pred_5 ?v2)
			    (pred_6 ?v7) (pred_4 ?v2))
       :effect (and (pred_2 ?v7 ?v2)
		    (pred_1)
		    (not (pred_6 ?v7)))))
