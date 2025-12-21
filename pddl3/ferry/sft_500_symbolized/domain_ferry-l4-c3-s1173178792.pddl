(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v3 ?v5)
		(pred_4 ?v8)
		(pred_6 ?v4)
		(pred_3 ?v4)
		(pred_2 ?v8 ?v4)
		(pred_5)
		(pred_1 ?v8))

   (:action op_3
       :parameters  (?v2 ?v1)
       :precondition (and (not-eq ?v2 ?v1) 
                          (pred_6 ?v2) (pred_6 ?v1) (pred_3 ?v2))
       :effect (and  (pred_3 ?v1)
		     (not (pred_3 ?v2))))


   (:action op_2
       :parameters (?v6 ?v7)
       :precondition  (and  (pred_4 ?v6) (pred_6 ?v7)
			    (pred_2 ?v6 ?v7) (pred_3 ?v7) (pred_5))
       :effect (and (pred_1 ?v6)
		    (not (pred_2 ?v6 ?v7)) 
		    (not (pred_5))))

   (:action op_1
       :parameters  (?v6  ?v7)
       :precondition  (and  (pred_4 ?v6) (pred_6 ?v7)
			    (pred_1 ?v6) (pred_3 ?v7))
       :effect (and (pred_2 ?v6 ?v7)
		    (pred_5)
		    (not (pred_1 ?v6)))))
