(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v8 ?v2)
		(pred_5 ?v7)
		(pred_4 ?v1)
		(pred_6 ?v1)
		(pred_2 ?v7 ?v1)
		(pred_1)
		(pred_3 ?v7))

   (:action op_2
       :parameters  (?v5 ?v3)
       :precondition (and (not-eq ?v5 ?v3) 
                          (pred_4 ?v5) (pred_4 ?v3) (pred_6 ?v5))
       :effect (and  (pred_6 ?v3)
		     (not (pred_6 ?v5))))


   (:action op_1
       :parameters (?v4 ?v6)
       :precondition  (and  (pred_5 ?v4) (pred_4 ?v6)
			    (pred_2 ?v4 ?v6) (pred_6 ?v6) (pred_1))
       :effect (and (pred_3 ?v4)
		    (not (pred_2 ?v4 ?v6)) 
		    (not (pred_1))))

   (:action op_3
       :parameters  (?v4  ?v6)
       :precondition  (and  (pred_5 ?v4) (pred_4 ?v6)
			    (pred_3 ?v4) (pred_6 ?v6))
       :effect (and (pred_2 ?v4 ?v6)
		    (pred_1)
		    (not (pred_3 ?v4)))))
