; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1266798217 --problem-name spanner-s3-n3-l4-s1266798217
(define (problem spanner-s3-n3-l4-s1266798217)
 (:domain spanner)
 (:objects 
     obj_10 - type_3
     obj_05 obj_01 obj_02 - type_1
     obj_08 obj_04 obj_12 - type_2
     obj_11 obj_06 obj_13 obj_09 - type_4
     obj_03 obj_07 - type_4
    )
 (:init 
    (pred_6 obj_10 obj_03)
    (pred_6 obj_05 obj_06)
    (pred_4 obj_05)
    (pred_6 obj_01 obj_13)
    (pred_4 obj_01)
    (pred_6 obj_02 obj_13)
    (pred_4 obj_02)
    (pred_2 obj_08)
    (pred_6 obj_08 obj_07)
    (pred_2 obj_04)
    (pred_6 obj_04 obj_07)
    (pred_2 obj_12)
    (pred_6 obj_12 obj_07)
    (pred_3 obj_03 obj_11)
    (pred_3 obj_09 obj_07)
    (pred_3 obj_11 obj_06)
    (pred_3 obj_06 obj_13)
    (pred_3 obj_13 obj_09)
)
 (:goal
  (and
   (pred_5 obj_08)
   (pred_5 obj_04)
   (pred_5 obj_12)
))
(:constraints
  (and
    (always (imply (not (pred_5 obj_08)) (not (pred_5 obj_04))))
    (forall (?m - type_3) (at-most-once (pred_6 ?m obj_03)))
  )
)
)
