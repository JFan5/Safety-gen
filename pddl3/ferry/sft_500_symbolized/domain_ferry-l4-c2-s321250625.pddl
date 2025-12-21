(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v6 ?v2)
		(pred_4 ?v4)
		(pred_1 ?v8)
		(pred_2 ?v8)
		(pred_3 ?v4 ?v8)
		(pred_5)
		(pred_6 ?v4))

   (:action op_1
       :parameters  (?v3 ?v5)
       :precondition (and (not-eq ?v3 ?v5) 
                          (pred_1 ?v3) (pred_1 ?v5) (pred_2 ?v3))
       :effect (and  (pred_2 ?v5)
		     (not (pred_2 ?v3))))


   (:action op_3
       :parameters (?v1 ?v7)
       :precondition  (and  (pred_4 ?v1) (pred_1 ?v7)
			    (pred_3 ?v1 ?v7) (pred_2 ?v7) (pred_5))
       :effect (and (pred_6 ?v1)
		    (not (pred_3 ?v1 ?v7)) 
		    (not (pred_5))))

   (:action op_2
       :parameters  (?v1  ?v7)
       :precondition  (and  (pred_4 ?v1) (pred_1 ?v7)
			    (pred_6 ?v1) (pred_2 ?v7))
       :effect (and (pred_3 ?v1 ?v7)
		    (pred_5)
		    (not (pred_6 ?v1)))))
