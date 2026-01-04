(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_05 obj_04 - type_3
obj_13 obj_14 obj_01 obj_12 - type_2
obj_08 obj_07 obj_03 obj_02 - type_1
obj_09 obj_11 obj_06 obj_10 - object)
(:init
(pred_2 obj_05 obj_07)
(pred_1 obj_05 obj_13)
(pred_1 obj_05 obj_14)
(pred_2 obj_04 obj_02)
(pred_1 obj_04 obj_01)
(pred_1 obj_04 obj_12)
(pred_3 obj_09 obj_07)
(pred_3 obj_11 obj_08)
(pred_3 obj_06 obj_03)
(pred_3 obj_10 obj_03)
)
(:goal
(and
(pred_3 obj_09 obj_02)
(pred_3 obj_11 obj_02)
(pred_3 obj_06 obj_03)
(pred_3 obj_10 obj_08)
)
)

(:constraints
  (and
    (always (not (and (pred_2 obj_05 obj_02) (pred_2 obj_04 obj_02))))
  )
)
)