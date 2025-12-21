(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_09 obj_12 - type_1
obj_08 obj_01 obj_02 obj_06 - type_3
obj_07 obj_04 obj_11 obj_14 - type_2
obj_13 obj_05 obj_10 obj_03 - object)
(:init
(pred_4 obj_09 obj_04)
(pred_2 obj_09 obj_08)
(pred_2 obj_09 obj_01)
(pred_4 obj_12 obj_14)
(pred_2 obj_12 obj_02)
(pred_2 obj_12 obj_06)
(pred_3 obj_13 obj_14)
(pred_3 obj_05 obj_07)
(pred_3 obj_10 obj_14)
(pred_3 obj_03 obj_07)
)
(:goal
(and
(pred_3 obj_13 obj_07)
(pred_3 obj_05 obj_04)
(pred_3 obj_10 obj_07)
(pred_3 obj_03 obj_07)
)
)

(:constraints
  (and
    (always (not (and (pred_4 obj_09 obj_07) (pred_4 obj_12 obj_07))))
  )
)
)