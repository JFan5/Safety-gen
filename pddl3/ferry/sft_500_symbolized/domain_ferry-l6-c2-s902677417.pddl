(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v2 ?v3)
		(pred_2 ?v6)
		(pred_3 ?v5)
		(pred_1 ?v5)
		(pred_6 ?v6 ?v5)
		(pred_5)
		(pred_4 ?v6))

   (:action op_3
       :parameters  (?v8 ?v1)
       :precondition (and (not-eq ?v8 ?v1) 
                          (pred_3 ?v8) (pred_3 ?v1) (pred_1 ?v8))
       :effect (and  (pred_1 ?v1)
		     (not (pred_1 ?v8))))


   (:action op_2
       :parameters (?v7 ?v4)
       :precondition  (and  (pred_2 ?v7) (pred_3 ?v4)
			    (pred_6 ?v7 ?v4) (pred_1 ?v4) (pred_5))
       :effect (and (pred_4 ?v7)
		    (not (pred_6 ?v7 ?v4)) 
		    (not (pred_5))))

   (:action op_1
       :parameters  (?v7  ?v4)
       :precondition  (and  (pred_2 ?v7) (pred_3 ?v4)
			    (pred_4 ?v7) (pred_1 ?v4))
       :effect (and (pred_6 ?v7 ?v4)
		    (pred_5)
		    (not (pred_4 ?v7)))))
