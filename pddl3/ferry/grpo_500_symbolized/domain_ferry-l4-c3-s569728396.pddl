(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v8 ?v5)
		(pred_4 ?v6)
		(pred_1 ?v1)
		(pred_3 ?v1)
		(pred_6 ?v6 ?v1)
		(pred_5)
		(pred_2 ?v6))

   (:action op_1
       :parameters  (?v4 ?v7)
       :precondition (and (not-eq ?v4 ?v7) 
                          (pred_1 ?v4) (pred_1 ?v7) (pred_3 ?v4))
       :effect (and  (pred_3 ?v7)
		     (not (pred_3 ?v4))))


   (:action op_2
       :parameters (?v2 ?v3)
       :precondition  (and  (pred_4 ?v2) (pred_1 ?v3)
			    (pred_6 ?v2 ?v3) (pred_3 ?v3) (pred_5))
       :effect (and (pred_2 ?v2)
		    (not (pred_6 ?v2 ?v3)) 
		    (not (pred_5))))

   (:action op_3
       :parameters  (?v2  ?v3)
       :precondition  (and  (pred_4 ?v2) (pred_1 ?v3)
			    (pred_2 ?v2) (pred_3 ?v3))
       :effect (and (pred_6 ?v2 ?v3)
		    (pred_5)
		    (not (pred_2 ?v2)))))
