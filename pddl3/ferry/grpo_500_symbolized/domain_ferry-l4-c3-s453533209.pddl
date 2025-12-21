(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v3 ?v5)
		(pred_6 ?v6)
		(pred_2 ?v1)
		(pred_4 ?v1)
		(pred_1 ?v6 ?v1)
		(pred_5)
		(pred_3 ?v6))

   (:action op_1
       :parameters  (?v8 ?v2)
       :precondition (and (not-eq ?v8 ?v2) 
                          (pred_2 ?v8) (pred_2 ?v2) (pred_4 ?v8))
       :effect (and  (pred_4 ?v2)
		     (not (pred_4 ?v8))))


   (:action op_2
       :parameters (?v7 ?v4)
       :precondition  (and  (pred_6 ?v7) (pred_2 ?v4)
			    (pred_1 ?v7 ?v4) (pred_4 ?v4) (pred_5))
       :effect (and (pred_3 ?v7)
		    (not (pred_1 ?v7 ?v4)) 
		    (not (pred_5))))

   (:action op_3
       :parameters  (?v7  ?v4)
       :precondition  (and  (pred_6 ?v7) (pred_2 ?v4)
			    (pred_3 ?v7) (pred_4 ?v4))
       :effect (and (pred_1 ?v7 ?v4)
		    (pred_5)
		    (not (pred_3 ?v7)))))
