(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_14 obj_13 - type_1
obj_06 obj_04 obj_11 obj_09 - type_2
obj_12 obj_08 obj_03 obj_10 - type_3
obj_05 obj_07 obj_01 obj_02 - object)
(:init
(pred_1 obj_14 obj_08)
(pred_3 obj_14 obj_06)
(pred_3 obj_14 obj_04)
(pred_1 obj_13 obj_03)
(pred_3 obj_13 obj_11)
(pred_3 obj_13 obj_09)
(pred_2 obj_05 obj_03)
(pred_2 obj_07 obj_10)
(pred_2 obj_01 obj_10)
(pred_2 obj_02 obj_08)
)
(:goal
(and
(pred_2 obj_05 obj_03)
(pred_2 obj_07 obj_10)
(pred_2 obj_01 obj_12)
(pred_2 obj_02 obj_12)
)
)

(:constraints
  (and
    (always (not (and (pred_1 obj_14 obj_12) (pred_1 obj_13 obj_12))))
  )
)
)