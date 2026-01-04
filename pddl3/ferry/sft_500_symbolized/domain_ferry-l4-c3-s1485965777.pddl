(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v3 ?v5)
		(pred_4 ?v4)
		(pred_6 ?v8)
		(pred_2 ?v8)
		(pred_5 ?v4 ?v8)
		(pred_1)
		(pred_3 ?v4))

   (:action op_2
       :parameters  (?v7 ?v2)
       :precondition (and (not-eq ?v7 ?v2) 
                          (pred_6 ?v7) (pred_6 ?v2) (pred_2 ?v7))
       :effect (and  (pred_2 ?v2)
		     (not (pred_2 ?v7))))


   (:action op_1
       :parameters (?v1 ?v6)
       :precondition  (and  (pred_4 ?v1) (pred_6 ?v6)
			    (pred_5 ?v1 ?v6) (pred_2 ?v6) (pred_1))
       :effect (and (pred_3 ?v1)
		    (not (pred_5 ?v1 ?v6)) 
		    (not (pred_1))))

   (:action op_3
       :parameters  (?v1  ?v6)
       :precondition  (and  (pred_4 ?v1) (pred_6 ?v6)
			    (pred_3 ?v1) (pred_2 ?v6))
       :effect (and (pred_5 ?v1 ?v6)
		    (pred_1)
		    (not (pred_3 ?v1)))))
