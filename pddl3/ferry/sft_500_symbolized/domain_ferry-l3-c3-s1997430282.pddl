(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v1 ?v5)
		(pred_4 ?v8)
		(pred_2 ?v7)
		(pred_6 ?v7)
		(pred_3 ?v8 ?v7)
		(pred_1)
		(pred_5 ?v8))

   (:action op_2
       :parameters  (?v6 ?v2)
       :precondition (and (not-eq ?v6 ?v2) 
                          (pred_2 ?v6) (pred_2 ?v2) (pred_6 ?v6))
       :effect (and  (pred_6 ?v2)
		     (not (pred_6 ?v6))))


   (:action op_3
       :parameters (?v3 ?v4)
       :precondition  (and  (pred_4 ?v3) (pred_2 ?v4)
			    (pred_3 ?v3 ?v4) (pred_6 ?v4) (pred_1))
       :effect (and (pred_5 ?v3)
		    (not (pred_3 ?v3 ?v4)) 
		    (not (pred_1))))

   (:action op_1
       :parameters  (?v3  ?v4)
       :precondition  (and  (pred_4 ?v3) (pred_2 ?v4)
			    (pred_5 ?v3) (pred_6 ?v4))
       :effect (and (pred_3 ?v3 ?v4)
		    (pred_1)
		    (not (pred_5 ?v3)))))
