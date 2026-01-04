(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v8 ?v1)
		(pred_6 ?v5)
		(pred_3 ?v4)
		(pred_2 ?v4)
		(pred_4 ?v5 ?v4)
		(pred_5)
		(pred_1 ?v5))

   (:action op_1
       :parameters  (?v7 ?v3)
       :precondition (and (not-eq ?v7 ?v3) 
                          (pred_3 ?v7) (pred_3 ?v3) (pred_2 ?v7))
       :effect (and  (pred_2 ?v3)
		     (not (pred_2 ?v7))))


   (:action op_2
       :parameters (?v2 ?v6)
       :precondition  (and  (pred_6 ?v2) (pred_3 ?v6)
			    (pred_4 ?v2 ?v6) (pred_2 ?v6) (pred_5))
       :effect (and (pred_1 ?v2)
		    (not (pred_4 ?v2 ?v6)) 
		    (not (pred_5))))

   (:action op_3
       :parameters  (?v2  ?v6)
       :precondition  (and  (pred_6 ?v2) (pred_3 ?v6)
			    (pred_1 ?v2) (pred_2 ?v6))
       :effect (and (pred_4 ?v2 ?v6)
		    (pred_5)
		    (not (pred_1 ?v2)))))
