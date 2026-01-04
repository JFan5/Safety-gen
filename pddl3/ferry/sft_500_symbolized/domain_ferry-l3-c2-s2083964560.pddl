(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v1 ?v2)
		(pred_5 ?v5)
		(pred_4 ?v7)
		(pred_6 ?v7)
		(pred_1 ?v5 ?v7)
		(pred_2)
		(pred_3 ?v5))

   (:action op_3
       :parameters  (?v6 ?v4)
       :precondition (and (not-eq ?v6 ?v4) 
                          (pred_4 ?v6) (pred_4 ?v4) (pred_6 ?v6))
       :effect (and  (pred_6 ?v4)
		     (not (pred_6 ?v6))))


   (:action op_1
       :parameters (?v8 ?v3)
       :precondition  (and  (pred_5 ?v8) (pred_4 ?v3)
			    (pred_1 ?v8 ?v3) (pred_6 ?v3) (pred_2))
       :effect (and (pred_3 ?v8)
		    (not (pred_1 ?v8 ?v3)) 
		    (not (pred_2))))

   (:action op_2
       :parameters  (?v8  ?v3)
       :precondition  (and  (pred_5 ?v8) (pred_4 ?v3)
			    (pred_3 ?v8) (pred_6 ?v3))
       :effect (and (pred_1 ?v8 ?v3)
		    (pred_2)
		    (not (pred_3 ?v8)))))
