(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v2 ?v1)
		(pred_6 ?v3)
		(pred_5 ?v8)
		(pred_2 ?v8)
		(pred_4 ?v3 ?v8)
		(pred_3)
		(pred_1 ?v3))

   (:action op_3
       :parameters  (?v5 ?v6)
       :precondition (and (not-eq ?v5 ?v6) 
                          (pred_5 ?v5) (pred_5 ?v6) (pred_2 ?v5))
       :effect (and  (pred_2 ?v6)
		     (not (pred_2 ?v5))))


   (:action op_1
       :parameters (?v4 ?v7)
       :precondition  (and  (pred_6 ?v4) (pred_5 ?v7)
			    (pred_4 ?v4 ?v7) (pred_2 ?v7) (pred_3))
       :effect (and (pred_1 ?v4)
		    (not (pred_4 ?v4 ?v7)) 
		    (not (pred_3))))

   (:action op_2
       :parameters  (?v4  ?v7)
       :precondition  (and  (pred_6 ?v4) (pred_5 ?v7)
			    (pred_1 ?v4) (pred_2 ?v7))
       :effect (and (pred_4 ?v4 ?v7)
		    (pred_3)
		    (not (pred_1 ?v4)))))
