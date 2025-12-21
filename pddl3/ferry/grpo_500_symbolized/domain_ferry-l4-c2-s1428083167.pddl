(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v4 ?v3)
		(pred_5 ?v2)
		(pred_1 ?v1)
		(pred_6 ?v1)
		(pred_3 ?v2 ?v1)
		(pred_2)
		(pred_4 ?v2))

   (:action op_1
       :parameters  (?v8 ?v5)
       :precondition (and (not-eq ?v8 ?v5) 
                          (pred_1 ?v8) (pred_1 ?v5) (pred_6 ?v8))
       :effect (and  (pred_6 ?v5)
		     (not (pred_6 ?v8))))


   (:action op_2
       :parameters (?v6 ?v7)
       :precondition  (and  (pred_5 ?v6) (pred_1 ?v7)
			    (pred_3 ?v6 ?v7) (pred_6 ?v7) (pred_2))
       :effect (and (pred_4 ?v6)
		    (not (pred_3 ?v6 ?v7)) 
		    (not (pred_2))))

   (:action op_3
       :parameters  (?v6  ?v7)
       :precondition  (and  (pred_5 ?v6) (pred_1 ?v7)
			    (pred_4 ?v6) (pred_6 ?v7))
       :effect (and (pred_3 ?v6 ?v7)
		    (pred_2)
		    (not (pred_4 ?v6)))))
