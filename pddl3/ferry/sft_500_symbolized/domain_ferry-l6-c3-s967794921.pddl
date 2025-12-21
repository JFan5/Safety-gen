(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v8 ?v6)
		(pred_4 ?v4)
		(pred_5 ?v5)
		(pred_2 ?v5)
		(pred_3 ?v4 ?v5)
		(pred_6)
		(pred_1 ?v4))

   (:action op_2
       :parameters  (?v2 ?v7)
       :precondition (and (not-eq ?v2 ?v7) 
                          (pred_5 ?v2) (pred_5 ?v7) (pred_2 ?v2))
       :effect (and  (pred_2 ?v7)
		     (not (pred_2 ?v2))))


   (:action op_1
       :parameters (?v1 ?v3)
       :precondition  (and  (pred_4 ?v1) (pred_5 ?v3)
			    (pred_3 ?v1 ?v3) (pred_2 ?v3) (pred_6))
       :effect (and (pred_1 ?v1)
		    (not (pred_3 ?v1 ?v3)) 
		    (not (pred_6))))

   (:action op_3
       :parameters  (?v1  ?v3)
       :precondition  (and  (pred_4 ?v1) (pred_5 ?v3)
			    (pred_1 ?v1) (pred_2 ?v3))
       :effect (and (pred_3 ?v1 ?v3)
		    (pred_6)
		    (not (pred_1 ?v1)))))
