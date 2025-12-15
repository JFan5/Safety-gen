; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1889602672 --problem-name spanner-s3-n3-l4-s1889602672
(define (problem spanner-s3-n3-l4-s1889602672)
 (:domain spanner)
 (:objects 
     obj_08 - type_3
     obj_03 obj_04 obj_06 - type_2
     obj_10 obj_01 obj_11 - type_5
     obj_02 obj_12 obj_05 obj_13 - type_1
     obj_07 obj_09 - type_1
    )
 (:init 
    (pred_2 obj_08 obj_07)
    (pred_2 obj_03 obj_13)
    (pred_1 obj_03)
    (pred_2 obj_04 obj_13)
    (pred_1 obj_04)
    (pred_2 obj_06 obj_13)
    (pred_1 obj_06)
    (pred_6 obj_10)
    (pred_2 obj_10 obj_09)
    (pred_6 obj_01)
    (pred_2 obj_01 obj_09)
    (pred_6 obj_11)
    (pred_2 obj_11 obj_09)
    (pred_4 obj_07 obj_02)
    (pred_4 obj_13 obj_09)
    (pred_4 obj_02 obj_12)
    (pred_4 obj_12 obj_05)
    (pred_4 obj_05 obj_13)
)
 (:goal
  (and
   (pred_3 obj_10)
   (pred_3 obj_01)
   (pred_3 obj_11)
))
(:constraints
  (and
    (always (imply (not (pred_3 obj_01)) (not (pred_3 obj_11))))
    (forall (?m - type_3) (at-most-once (pred_2 ?m obj_07)))
  )
)
)
