(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v4 ?v2)
		(pred_3 ?v7)
		(pred_2 ?v5)
		(pred_1 ?v5)
		(pred_6 ?v7 ?v5)
		(pred_4)
		(pred_5 ?v7))

   (:action op_1
       :parameters  (?v6 ?v3)
       :precondition (and (not-eq ?v6 ?v3) 
                          (pred_2 ?v6) (pred_2 ?v3) (pred_1 ?v6))
       :effect (and  (pred_1 ?v3)
		     (not (pred_1 ?v6))))


   (:action op_2
       :parameters (?v1 ?v8)
       :precondition  (and  (pred_3 ?v1) (pred_2 ?v8)
			    (pred_6 ?v1 ?v8) (pred_1 ?v8) (pred_4))
       :effect (and (pred_5 ?v1)
		    (not (pred_6 ?v1 ?v8)) 
		    (not (pred_4))))

   (:action op_3
       :parameters  (?v1  ?v8)
       :precondition  (and  (pred_3 ?v1) (pred_2 ?v8)
			    (pred_5 ?v1) (pred_1 ?v8))
       :effect (and (pred_6 ?v1 ?v8)
		    (pred_4)
		    (not (pred_5 ?v1)))))
