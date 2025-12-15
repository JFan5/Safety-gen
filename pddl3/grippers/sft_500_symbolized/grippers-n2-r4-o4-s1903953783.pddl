(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_03 obj_10 - type_1
obj_06 obj_05 obj_04 obj_01 - type_2
obj_12 obj_14 obj_08 obj_07 - type_3
obj_11 obj_09 obj_02 obj_13 - object)
(:init
(pred_1 obj_03 obj_08)
(pred_2 obj_03 obj_06)
(pred_2 obj_03 obj_05)
(pred_1 obj_10 obj_12)
(pred_2 obj_10 obj_04)
(pred_2 obj_10 obj_01)
(pred_3 obj_11 obj_07)
(pred_3 obj_09 obj_12)
(pred_3 obj_02 obj_07)
(pred_3 obj_13 obj_14)
)
(:goal
(and
(pred_3 obj_11 obj_07)
(pred_3 obj_09 obj_07)
(pred_3 obj_02 obj_07)
(pred_3 obj_13 obj_07)
)
)

(:constraints
  (and
    (always (not (and (pred_1 obj_03 obj_07) (pred_1 obj_10 obj_07))))
  )
)
)