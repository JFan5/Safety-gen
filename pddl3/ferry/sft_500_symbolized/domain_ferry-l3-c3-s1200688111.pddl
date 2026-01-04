(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v4 ?v5)
		(pred_5 ?v8)
		(pred_6 ?v6)
		(pred_1 ?v6)
		(pred_4 ?v8 ?v6)
		(pred_3)
		(pred_2 ?v8))

   (:action op_1
       :parameters  (?v3 ?v1)
       :precondition (and (not-eq ?v3 ?v1) 
                          (pred_6 ?v3) (pred_6 ?v1) (pred_1 ?v3))
       :effect (and  (pred_1 ?v1)
		     (not (pred_1 ?v3))))


   (:action op_3
       :parameters (?v7 ?v2)
       :precondition  (and  (pred_5 ?v7) (pred_6 ?v2)
			    (pred_4 ?v7 ?v2) (pred_1 ?v2) (pred_3))
       :effect (and (pred_2 ?v7)
		    (not (pred_4 ?v7 ?v2)) 
		    (not (pred_3))))

   (:action op_2
       :parameters  (?v7  ?v2)
       :precondition  (and  (pred_5 ?v7) (pred_6 ?v2)
			    (pred_2 ?v7) (pred_1 ?v2))
       :effect (and (pred_4 ?v7 ?v2)
		    (pred_3)
		    (not (pred_2 ?v7)))))
