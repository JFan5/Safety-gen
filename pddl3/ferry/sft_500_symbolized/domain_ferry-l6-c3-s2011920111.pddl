(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v7 ?v4)
		(pred_3 ?v2)
		(pred_5 ?v6)
		(pred_4 ?v6)
		(pred_1 ?v2 ?v6)
		(pred_6)
		(pred_2 ?v2))

   (:action op_2
       :parameters  (?v8 ?v3)
       :precondition (and (not-eq ?v8 ?v3) 
                          (pred_5 ?v8) (pred_5 ?v3) (pred_4 ?v8))
       :effect (and  (pred_4 ?v3)
		     (not (pred_4 ?v8))))


   (:action op_3
       :parameters (?v5 ?v1)
       :precondition  (and  (pred_3 ?v5) (pred_5 ?v1)
			    (pred_1 ?v5 ?v1) (pred_4 ?v1) (pred_6))
       :effect (and (pred_2 ?v5)
		    (not (pred_1 ?v5 ?v1)) 
		    (not (pred_6))))

   (:action op_1
       :parameters  (?v5  ?v1)
       :precondition  (and  (pred_3 ?v5) (pred_5 ?v1)
			    (pred_2 ?v5) (pred_4 ?v1))
       :effect (and (pred_1 ?v5 ?v1)
		    (pred_6)
		    (not (pred_2 ?v5)))))
