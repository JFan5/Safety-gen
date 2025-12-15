(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v5 ?v1)
		(pred_6 ?v6)
		(pred_4 ?v4)
		(pred_3 ?v4)
		(pred_2 ?v6 ?v4)
		(pred_5)
		(pred_1 ?v6))

   (:action op_3
       :parameters  (?v3 ?v8)
       :precondition (and (not-eq ?v3 ?v8) 
                          (pred_4 ?v3) (pred_4 ?v8) (pred_3 ?v3))
       :effect (and  (pred_3 ?v8)
		     (not (pred_3 ?v3))))


   (:action op_2
       :parameters (?v7 ?v2)
       :precondition  (and  (pred_6 ?v7) (pred_4 ?v2)
			    (pred_2 ?v7 ?v2) (pred_3 ?v2) (pred_5))
       :effect (and (pred_1 ?v7)
		    (not (pred_2 ?v7 ?v2)) 
		    (not (pred_5))))

   (:action op_1
       :parameters  (?v7  ?v2)
       :precondition  (and  (pred_6 ?v7) (pred_4 ?v2)
			    (pred_1 ?v7) (pred_3 ?v2))
       :effect (and (pred_2 ?v7 ?v2)
		    (pred_5)
		    (not (pred_1 ?v7)))))
