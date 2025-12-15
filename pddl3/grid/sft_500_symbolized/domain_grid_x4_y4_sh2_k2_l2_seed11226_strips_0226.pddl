(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_10 ?v9 ?v5)
             (pred_6 ?v4 ?v6)
             (pred_9 ?v9 ?v6)
             (pred_12 ?v1 ?v9 )
	     (pred_7 ?v9)
             (pred_11 ?v2)
             (pred_4 ?v4)
             (pred_8 ?v6)
             (pred_2 ?v9)
             (pred_5 ?v4)
             (pred_1 ?v9)
             (pred_3 ))



(:action op_2
:parameters (?v7 ?v11 ?v3 ?v10)
:precondition (and (pred_11 ?v7) (pred_11 ?v11) (pred_4 ?v3) (pred_8 ?v10)
          (pred_10 ?v7 ?v11) (pred_6 ?v3 ?v10)
                   (pred_9 ?v11 ?v10) (pred_7 ?v7) 
                   (pred_2 ?v11) (pred_5 ?v3))
:effect (and  (pred_1 ?v11) (not (pred_2 ?v11))))


(:action op_5
:parameters (?v7 ?v12)
:precondition (and (pred_11 ?v7) (pred_11 ?v12)
               (pred_7 ?v7) (pred_10 ?v7 ?v12) (pred_1 ?v12))
:effect (and (pred_7 ?v12) (not (pred_7 ?v7))))

(:action op_4
:parameters (?v7 ?v3)
:precondition (and (pred_11 ?v7) (pred_4 ?v3) 
                  (pred_7 ?v7) (pred_12 ?v3 ?v7) (pred_3 ))
:effect (and (pred_5 ?v3)
   (not (pred_12 ?v3 ?v7)) (not (pred_3 ))))


(:action op_3
:parameters (?v7 ?v13 ?v8)
:precondition (and (pred_11 ?v7) (pred_4 ?v13) (pred_4 ?v8)
                  (pred_7 ?v7) (pred_5 ?v8) (pred_12 ?v13 ?v7))
:effect (and (pred_5 ?v13) (pred_12 ?v8 ?v7)
        (not (pred_5 ?v8)) (not (pred_12 ?v13 ?v7))))

(:action op_1
:parameters (?v7 ?v3)
:precondition (and (pred_11 ?v7) (pred_4 ?v3) 
                  (pred_7 ?v7) (pred_5 ?v3))
:effect (and (pred_3 ) (pred_12 ?v3 ?v7) (not (pred_5 ?v3)))))


	
