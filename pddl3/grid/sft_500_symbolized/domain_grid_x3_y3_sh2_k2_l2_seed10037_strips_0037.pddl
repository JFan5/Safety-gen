(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_1 ?v8 ?v12)
             (pred_7 ?v10 ?v1)
             (pred_2 ?v8 ?v1)
             (pred_6 ?v4 ?v8 )
	     (pred_3 ?v8)
             (pred_4 ?v5)
             (pred_9 ?v10)
             (pred_8 ?v1)
             (pred_10 ?v8)
             (pred_5 ?v10)
             (pred_11 ?v8)
             (pred_12 ))



(:action op_3
:parameters (?v7 ?v11 ?v2 ?v9)
:precondition (and (pred_4 ?v7) (pred_4 ?v11) (pred_9 ?v2) (pred_8 ?v9)
          (pred_1 ?v7 ?v11) (pred_7 ?v2 ?v9)
                   (pred_2 ?v11 ?v9) (pred_3 ?v7) 
                   (pred_10 ?v11) (pred_5 ?v2))
:effect (and  (pred_11 ?v11) (not (pred_10 ?v11))))


(:action op_5
:parameters (?v7 ?v6)
:precondition (and (pred_4 ?v7) (pred_4 ?v6)
               (pred_3 ?v7) (pred_1 ?v7 ?v6) (pred_11 ?v6))
:effect (and (pred_3 ?v6) (not (pred_3 ?v7))))

(:action op_4
:parameters (?v7 ?v2)
:precondition (and (pred_4 ?v7) (pred_9 ?v2) 
                  (pred_3 ?v7) (pred_6 ?v2 ?v7) (pred_12 ))
:effect (and (pred_5 ?v2)
   (not (pred_6 ?v2 ?v7)) (not (pred_12 ))))


(:action op_2
:parameters (?v7 ?v13 ?v3)
:precondition (and (pred_4 ?v7) (pred_9 ?v13) (pred_9 ?v3)
                  (pred_3 ?v7) (pred_5 ?v3) (pred_6 ?v13 ?v7))
:effect (and (pred_5 ?v13) (pred_6 ?v3 ?v7)
        (not (pred_5 ?v3)) (not (pred_6 ?v13 ?v7))))

(:action op_1
:parameters (?v7 ?v2)
:precondition (and (pred_4 ?v7) (pred_9 ?v2) 
                  (pred_3 ?v7) (pred_5 ?v2))
:effect (and (pred_12 ) (pred_6 ?v2 ?v7) (not (pred_5 ?v2)))))


	
