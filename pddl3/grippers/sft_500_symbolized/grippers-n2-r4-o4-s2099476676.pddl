(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_07 obj_06 - type_3
obj_10 obj_12 obj_13 obj_04 - type_1
obj_11 obj_02 obj_01 obj_08 - type_2
obj_03 obj_09 obj_05 obj_14 - object)
(:init
(pred_1 obj_07 obj_11)
(pred_3 obj_07 obj_10)
(pred_3 obj_07 obj_12)
(pred_1 obj_06 obj_08)
(pred_3 obj_06 obj_13)
(pred_3 obj_06 obj_04)
(pred_2 obj_03 obj_01)
(pred_2 obj_09 obj_01)
(pred_2 obj_05 obj_11)
(pred_2 obj_14 obj_08)
)
(:goal
(and
(pred_2 obj_03 obj_02)
(pred_2 obj_09 obj_08)
(pred_2 obj_05 obj_02)
(pred_2 obj_14 obj_08)
)
)

(:constraints
  (and
    (always (not (and (pred_1 obj_07 obj_02) (pred_1 obj_06 obj_02))))
  )
)
)