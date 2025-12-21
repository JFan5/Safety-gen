(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v7 ?v5)
		(pred_2 ?v6)
		(pred_4 ?v3)
		(pred_1 ?v3)
		(pred_3 ?v6 ?v3)
		(pred_6)
		(pred_5 ?v6))

   (:action op_3
       :parameters  (?v2 ?v1)
       :precondition (and (not-eq ?v2 ?v1) 
                          (pred_4 ?v2) (pred_4 ?v1) (pred_1 ?v2))
       :effect (and  (pred_1 ?v1)
		     (not (pred_1 ?v2))))


   (:action op_1
       :parameters (?v8 ?v4)
       :precondition  (and  (pred_2 ?v8) (pred_4 ?v4)
			    (pred_3 ?v8 ?v4) (pred_1 ?v4) (pred_6))
       :effect (and (pred_5 ?v8)
		    (not (pred_3 ?v8 ?v4)) 
		    (not (pred_6))))

   (:action op_2
       :parameters  (?v8  ?v4)
       :precondition  (and  (pred_2 ?v8) (pred_4 ?v4)
			    (pred_5 ?v8) (pred_1 ?v4))
       :effect (and (pred_3 ?v8 ?v4)
		    (pred_6)
		    (not (pred_5 ?v8)))))
