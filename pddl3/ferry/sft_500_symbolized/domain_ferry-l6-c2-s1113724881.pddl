(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v1 ?v3)
		(pred_1 ?v8)
		(pred_4 ?v2)
		(pred_2 ?v2)
		(pred_3 ?v8 ?v2)
		(pred_5)
		(pred_6 ?v8))

   (:action op_3
       :parameters  (?v5 ?v4)
       :precondition (and (not-eq ?v5 ?v4) 
                          (pred_4 ?v5) (pred_4 ?v4) (pred_2 ?v5))
       :effect (and  (pred_2 ?v4)
		     (not (pred_2 ?v5))))


   (:action op_1
       :parameters (?v6 ?v7)
       :precondition  (and  (pred_1 ?v6) (pred_4 ?v7)
			    (pred_3 ?v6 ?v7) (pred_2 ?v7) (pred_5))
       :effect (and (pred_6 ?v6)
		    (not (pred_3 ?v6 ?v7)) 
		    (not (pred_5))))

   (:action op_2
       :parameters  (?v6  ?v7)
       :precondition  (and  (pred_1 ?v6) (pred_4 ?v7)
			    (pred_6 ?v6) (pred_2 ?v7))
       :effect (and (pred_3 ?v6 ?v7)
		    (pred_5)
		    (not (pred_6 ?v6)))))
