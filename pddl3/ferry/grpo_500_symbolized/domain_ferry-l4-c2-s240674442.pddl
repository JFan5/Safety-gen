(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v6 ?v5)
		(pred_3 ?v7)
		(pred_2 ?v2)
		(pred_4 ?v2)
		(pred_1 ?v7 ?v2)
		(pred_6)
		(pred_5 ?v7))

   (:action op_2
       :parameters  (?v4 ?v1)
       :precondition (and (not-eq ?v4 ?v1) 
                          (pred_2 ?v4) (pred_2 ?v1) (pred_4 ?v4))
       :effect (and  (pred_4 ?v1)
		     (not (pred_4 ?v4))))


   (:action op_3
       :parameters (?v3 ?v8)
       :precondition  (and  (pred_3 ?v3) (pred_2 ?v8)
			    (pred_1 ?v3 ?v8) (pred_4 ?v8) (pred_6))
       :effect (and (pred_5 ?v3)
		    (not (pred_1 ?v3 ?v8)) 
		    (not (pred_6))))

   (:action op_1
       :parameters  (?v3  ?v8)
       :precondition  (and  (pred_3 ?v3) (pred_2 ?v8)
			    (pred_5 ?v3) (pred_4 ?v8))
       :effect (and (pred_1 ?v3 ?v8)
		    (pred_6)
		    (not (pred_5 ?v3)))))
