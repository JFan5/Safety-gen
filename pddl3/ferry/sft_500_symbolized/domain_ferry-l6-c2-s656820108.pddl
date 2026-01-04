(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v7 ?v5)
		(pred_3 ?v8)
		(pred_1 ?v2)
		(pred_4 ?v2)
		(pred_5 ?v8 ?v2)
		(pred_6)
		(pred_2 ?v8))

   (:action op_3
       :parameters  (?v4 ?v1)
       :precondition (and (not-eq ?v4 ?v1) 
                          (pred_1 ?v4) (pred_1 ?v1) (pred_4 ?v4))
       :effect (and  (pred_4 ?v1)
		     (not (pred_4 ?v4))))


   (:action op_2
       :parameters (?v6 ?v3)
       :precondition  (and  (pred_3 ?v6) (pred_1 ?v3)
			    (pred_5 ?v6 ?v3) (pred_4 ?v3) (pred_6))
       :effect (and (pred_2 ?v6)
		    (not (pred_5 ?v6 ?v3)) 
		    (not (pred_6))))

   (:action op_1
       :parameters  (?v6  ?v3)
       :precondition  (and  (pred_3 ?v6) (pred_1 ?v3)
			    (pred_2 ?v6) (pred_4 ?v3))
       :effect (and (pred_5 ?v6 ?v3)
		    (pred_6)
		    (not (pred_2 ?v6)))))
