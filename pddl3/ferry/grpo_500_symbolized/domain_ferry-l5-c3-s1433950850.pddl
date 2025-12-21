(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v6 ?v3)
		(pred_6 ?v4)
		(pred_3 ?v7)
		(pred_2 ?v7)
		(pred_5 ?v4 ?v7)
		(pred_4)
		(pred_1 ?v4))

   (:action op_2
       :parameters  (?v8 ?v2)
       :precondition (and (not-eq ?v8 ?v2) 
                          (pred_3 ?v8) (pred_3 ?v2) (pred_2 ?v8))
       :effect (and  (pred_2 ?v2)
		     (not (pred_2 ?v8))))


   (:action op_3
       :parameters (?v5 ?v1)
       :precondition  (and  (pred_6 ?v5) (pred_3 ?v1)
			    (pred_5 ?v5 ?v1) (pred_2 ?v1) (pred_4))
       :effect (and (pred_1 ?v5)
		    (not (pred_5 ?v5 ?v1)) 
		    (not (pred_4))))

   (:action op_1
       :parameters  (?v5  ?v1)
       :precondition  (and  (pred_6 ?v5) (pred_3 ?v1)
			    (pred_1 ?v5) (pred_2 ?v1))
       :effect (and (pred_5 ?v5 ?v1)
		    (pred_4)
		    (not (pred_1 ?v5)))))
