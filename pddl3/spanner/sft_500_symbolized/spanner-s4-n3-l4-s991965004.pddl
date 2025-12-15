; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 4 3 4 --seed 991965004 --problem-name spanner-s4-n3-l4-s991965004
(define (problem spanner-s4-n3-l4-s991965004)
 (:domain spanner)
 (:objects 
     obj_03 - type_5
     obj_14 obj_01 obj_07 obj_09 - type_4
     obj_05 obj_13 obj_06 - type_1
     obj_12 obj_08 obj_11 obj_10 - type_2
     obj_02 obj_04 - type_2
    )
 (:init 
    (pred_6 obj_03 obj_02)
    (pred_6 obj_14 obj_11)
    (pred_4 obj_14)
    (pred_6 obj_01 obj_12)
    (pred_4 obj_01)
    (pred_6 obj_07 obj_12)
    (pred_4 obj_07)
    (pred_6 obj_09 obj_11)
    (pred_4 obj_09)
    (pred_2 obj_05)
    (pred_6 obj_05 obj_04)
    (pred_2 obj_13)
    (pred_6 obj_13 obj_04)
    (pred_2 obj_06)
    (pred_6 obj_06 obj_04)
    (pred_1 obj_02 obj_12)
    (pred_1 obj_10 obj_04)
    (pred_1 obj_12 obj_08)
    (pred_1 obj_08 obj_11)
    (pred_1 obj_11 obj_10)
)
 (:goal
  (and
   (pred_3 obj_05)
   (pred_3 obj_13)
   (pred_3 obj_06)
))
(:constraints
  (and
    (always (imply (not (pred_3 obj_13)) (not (pred_3 obj_06))))
    (forall (?m - type_5) (at-most-once (pred_6 ?m obj_02)))
  )
)
)
