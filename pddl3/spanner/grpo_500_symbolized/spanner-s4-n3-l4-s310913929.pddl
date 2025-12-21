; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 4 3 4 --seed 310913929 --problem-name spanner-s4-n3-l4-s310913929
(define (problem spanner-s4-n3-l4-s310913929)
 (:domain spanner)
 (:objects 
     obj_04 - type_5
     obj_01 obj_08 obj_06 obj_14 - type_3
     obj_13 obj_03 obj_02 - type_1
     obj_11 obj_12 obj_10 obj_07 - type_2
     obj_09 obj_05 - type_2
    )
 (:init 
    (pred_6 obj_04 obj_09)
    (pred_6 obj_01 obj_12)
    (pred_5 obj_01)
    (pred_6 obj_08 obj_11)
    (pred_5 obj_08)
    (pred_6 obj_06 obj_12)
    (pred_5 obj_06)
    (pred_6 obj_14 obj_10)
    (pred_5 obj_14)
    (pred_4 obj_13)
    (pred_6 obj_13 obj_05)
    (pred_4 obj_03)
    (pred_6 obj_03 obj_05)
    (pred_4 obj_02)
    (pred_6 obj_02 obj_05)
    (pred_3 obj_09 obj_11)
    (pred_3 obj_07 obj_05)
    (pred_3 obj_11 obj_12)
    (pred_3 obj_12 obj_10)
    (pred_3 obj_10 obj_07)
)
 (:goal
  (and
   (pred_1 obj_13)
   (pred_1 obj_03)
   (pred_1 obj_02)
))
(:constraints
  (and
    (always (imply (not (pred_1 obj_13)) (not (pred_1 obj_03))))
    (forall (?m - type_5) (at-most-once (pred_6 ?m obj_09)))
  )
)
)
