(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v6 ?v2)
		(pred_5 ?v3)
		(pred_2 ?v5)
		(pred_6 ?v5)
		(pred_3 ?v3 ?v5)
		(pred_4)
		(pred_1 ?v3))

   (:action op_2
       :parameters  (?v8 ?v1)
       :precondition (and (not-eq ?v8 ?v1) 
                          (pred_2 ?v8) (pred_2 ?v1) (pred_6 ?v8))
       :effect (and  (pred_6 ?v1)
		     (not (pred_6 ?v8))))


   (:action op_1
       :parameters (?v4 ?v7)
       :precondition  (and  (pred_5 ?v4) (pred_2 ?v7)
			    (pred_3 ?v4 ?v7) (pred_6 ?v7) (pred_4))
       :effect (and (pred_1 ?v4)
		    (not (pred_3 ?v4 ?v7)) 
		    (not (pred_4))))

   (:action op_3
       :parameters  (?v4  ?v7)
       :precondition  (and  (pred_5 ?v4) (pred_2 ?v7)
			    (pred_1 ?v4) (pred_6 ?v7))
       :effect (and (pred_3 ?v4 ?v7)
		    (pred_4)
		    (not (pred_1 ?v4)))))
