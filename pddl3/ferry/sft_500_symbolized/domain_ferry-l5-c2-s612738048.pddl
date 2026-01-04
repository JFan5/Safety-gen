(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v4 ?v2)
		(pred_5 ?v7)
		(pred_1 ?v6)
		(pred_2 ?v6)
		(pred_3 ?v7 ?v6)
		(pred_4)
		(pred_6 ?v7))

   (:action op_2
       :parameters  (?v8 ?v3)
       :precondition (and (not-eq ?v8 ?v3) 
                          (pred_1 ?v8) (pred_1 ?v3) (pred_2 ?v8))
       :effect (and  (pred_2 ?v3)
		     (not (pred_2 ?v8))))


   (:action op_1
       :parameters (?v5 ?v1)
       :precondition  (and  (pred_5 ?v5) (pred_1 ?v1)
			    (pred_3 ?v5 ?v1) (pred_2 ?v1) (pred_4))
       :effect (and (pred_6 ?v5)
		    (not (pred_3 ?v5 ?v1)) 
		    (not (pred_4))))

   (:action op_3
       :parameters  (?v5  ?v1)
       :precondition  (and  (pred_5 ?v5) (pred_1 ?v1)
			    (pred_6 ?v5) (pred_2 ?v1))
       :effect (and (pred_3 ?v5 ?v1)
		    (pred_4)
		    (not (pred_6 ?v5)))))
