(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v7 ?v3)
		(pred_6 ?v1)
		(pred_3 ?v5)
		(pred_2 ?v5)
		(pred_1 ?v1 ?v5)
		(pred_4)
		(pred_5 ?v1))

   (:action op_3
       :parameters  (?v6 ?v2)
       :precondition (and (not-eq ?v6 ?v2) 
                          (pred_3 ?v6) (pred_3 ?v2) (pred_2 ?v6))
       :effect (and  (pred_2 ?v2)
		     (not (pred_2 ?v6))))


   (:action op_2
       :parameters (?v4 ?v8)
       :precondition  (and  (pred_6 ?v4) (pred_3 ?v8)
			    (pred_1 ?v4 ?v8) (pred_2 ?v8) (pred_4))
       :effect (and (pred_5 ?v4)
		    (not (pred_1 ?v4 ?v8)) 
		    (not (pred_4))))

   (:action op_1
       :parameters  (?v4  ?v8)
       :precondition  (and  (pred_6 ?v4) (pred_3 ?v8)
			    (pred_5 ?v4) (pred_2 ?v8))
       :effect (and (pred_1 ?v4 ?v8)
		    (pred_4)
		    (not (pred_5 ?v4)))))
