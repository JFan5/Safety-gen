(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v2 ?v5)
		(pred_4 ?v1)
		(pred_6 ?v4)
		(pred_5 ?v4)
		(pred_3 ?v1 ?v4)
		(pred_2)
		(pred_1 ?v1))

   (:action op_2
       :parameters  (?v6 ?v7)
       :precondition (and (not-eq ?v6 ?v7) 
                          (pred_6 ?v6) (pred_6 ?v7) (pred_5 ?v6))
       :effect (and  (pred_5 ?v7)
		     (not (pred_5 ?v6))))


   (:action op_3
       :parameters (?v8 ?v3)
       :precondition  (and  (pred_4 ?v8) (pred_6 ?v3)
			    (pred_3 ?v8 ?v3) (pred_5 ?v3) (pred_2))
       :effect (and (pred_1 ?v8)
		    (not (pred_3 ?v8 ?v3)) 
		    (not (pred_2))))

   (:action op_1
       :parameters  (?v8  ?v3)
       :precondition  (and  (pred_4 ?v8) (pred_6 ?v3)
			    (pred_1 ?v8) (pred_5 ?v3))
       :effect (and (pred_3 ?v8 ?v3)
		    (pred_2)
		    (not (pred_1 ?v8)))))
