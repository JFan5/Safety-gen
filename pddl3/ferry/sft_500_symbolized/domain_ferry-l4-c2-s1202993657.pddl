(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v2 ?v7)
		(pred_1 ?v1)
		(pred_6 ?v4)
		(pred_5 ?v4)
		(pred_3 ?v1 ?v4)
		(pred_4)
		(pred_2 ?v1))

   (:action op_2
       :parameters  (?v6 ?v3)
       :precondition (and (not-eq ?v6 ?v3) 
                          (pred_6 ?v6) (pred_6 ?v3) (pred_5 ?v6))
       :effect (and  (pred_5 ?v3)
		     (not (pred_5 ?v6))))


   (:action op_3
       :parameters (?v8 ?v5)
       :precondition  (and  (pred_1 ?v8) (pred_6 ?v5)
			    (pred_3 ?v8 ?v5) (pred_5 ?v5) (pred_4))
       :effect (and (pred_2 ?v8)
		    (not (pred_3 ?v8 ?v5)) 
		    (not (pred_4))))

   (:action op_1
       :parameters  (?v8  ?v5)
       :precondition  (and  (pred_1 ?v8) (pred_6 ?v5)
			    (pred_2 ?v8) (pred_5 ?v5))
       :effect (and (pred_3 ?v8 ?v5)
		    (pred_4)
		    (not (pred_2 ?v8)))))
