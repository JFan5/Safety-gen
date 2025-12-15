; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1759715865 --problem-name spanner-s3-n3-l4-s1759715865
(define (problem spanner-s3-n3-l4-s1759715865)
 (:domain spanner)
 (:objects 
     obj_13 - type_1
     obj_09 obj_07 obj_03 - type_2
     obj_04 obj_11 obj_02 - type_4
     obj_08 obj_01 obj_12 obj_06 - type_5
     obj_10 obj_05 - type_5
    )
 (:init 
    (pred_4 obj_13 obj_10)
    (pred_4 obj_09 obj_08)
    (pred_6 obj_09)
    (pred_4 obj_07 obj_12)
    (pred_6 obj_07)
    (pred_4 obj_03 obj_12)
    (pred_6 obj_03)
    (pred_5 obj_04)
    (pred_4 obj_04 obj_05)
    (pred_5 obj_11)
    (pred_4 obj_11 obj_05)
    (pred_5 obj_02)
    (pred_4 obj_02 obj_05)
    (pred_3 obj_10 obj_08)
    (pred_3 obj_06 obj_05)
    (pred_3 obj_08 obj_01)
    (pred_3 obj_01 obj_12)
    (pred_3 obj_12 obj_06)
)
 (:goal
  (and
   (pred_2 obj_04)
   (pred_2 obj_11)
   (pred_2 obj_02)
))
(:constraints
  (and
    (always (imply (not (pred_2 obj_04)) (not (pred_2 obj_11))))
    (forall (?m - type_1) (at-most-once (pred_4 ?m obj_10)))
  )
)
)
