(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_08 obj_03 - type_1
obj_01 obj_06 obj_14 obj_10 - type_2
obj_12 obj_11 obj_07 obj_13 - type_3
obj_04 obj_05 obj_09 obj_02 - object)
(:init
(pred_1 obj_08 obj_13)
(pred_3 obj_08 obj_01)
(pred_3 obj_08 obj_06)
(pred_1 obj_03 obj_07)
(pred_3 obj_03 obj_14)
(pred_3 obj_03 obj_10)
(pred_2 obj_04 obj_12)
(pred_2 obj_05 obj_12)
(pred_2 obj_09 obj_12)
(pred_2 obj_02 obj_07)
)
(:goal
(and
(pred_2 obj_04 obj_12)
(pred_2 obj_05 obj_11)
(pred_2 obj_09 obj_07)
(pred_2 obj_02 obj_07)
)
)

(:constraints
  (and
    (always (not (and (pred_1 obj_08 obj_07) (pred_1 obj_03 obj_07))))
  )
)
)