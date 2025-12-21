(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v6 ?v2)
		(pred_3 ?v3)
		(pred_1 ?v4)
		(pred_5 ?v4)
		(pred_2 ?v3 ?v4)
		(pred_6)
		(pred_4 ?v3))

   (:action op_1
       :parameters  (?v8 ?v7)
       :precondition (and (not-eq ?v8 ?v7) 
                          (pred_1 ?v8) (pred_1 ?v7) (pred_5 ?v8))
       :effect (and  (pred_5 ?v7)
		     (not (pred_5 ?v8))))


   (:action op_3
       :parameters (?v1 ?v5)
       :precondition  (and  (pred_3 ?v1) (pred_1 ?v5)
			    (pred_2 ?v1 ?v5) (pred_5 ?v5) (pred_6))
       :effect (and (pred_4 ?v1)
		    (not (pred_2 ?v1 ?v5)) 
		    (not (pred_6))))

   (:action op_2
       :parameters  (?v1  ?v5)
       :precondition  (and  (pred_3 ?v1) (pred_1 ?v5)
			    (pred_4 ?v1) (pred_5 ?v5))
       :effect (and (pred_2 ?v1 ?v5)
		    (pred_6)
		    (not (pred_4 ?v1)))))
