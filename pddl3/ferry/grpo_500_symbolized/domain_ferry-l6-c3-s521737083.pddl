(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v8 ?v5)
		(pred_2 ?v2)
		(pred_4 ?v3)
		(pred_1 ?v3)
		(pred_3 ?v2 ?v3)
		(pred_6)
		(pred_5 ?v2))

   (:action op_2
       :parameters  (?v1 ?v4)
       :precondition (and (not-eq ?v1 ?v4) 
                          (pred_4 ?v1) (pred_4 ?v4) (pred_1 ?v1))
       :effect (and  (pred_1 ?v4)
		     (not (pred_1 ?v1))))


   (:action op_3
       :parameters (?v6 ?v7)
       :precondition  (and  (pred_2 ?v6) (pred_4 ?v7)
			    (pred_3 ?v6 ?v7) (pred_1 ?v7) (pred_6))
       :effect (and (pred_5 ?v6)
		    (not (pred_3 ?v6 ?v7)) 
		    (not (pred_6))))

   (:action op_1
       :parameters  (?v6  ?v7)
       :precondition  (and  (pred_2 ?v6) (pred_4 ?v7)
			    (pred_5 ?v6) (pred_1 ?v7))
       :effect (and (pred_3 ?v6 ?v7)
		    (pred_6)
		    (not (pred_5 ?v6)))))
