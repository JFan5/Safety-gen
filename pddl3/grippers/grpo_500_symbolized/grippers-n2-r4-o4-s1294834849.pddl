(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_03 obj_10 - type_1
obj_04 obj_09 obj_11 obj_01 - type_3
obj_07 obj_02 obj_13 obj_14 - type_2
obj_05 obj_06 obj_08 obj_12 - object)
(:init
(pred_4 obj_03 obj_07)
(pred_2 obj_03 obj_04)
(pred_2 obj_03 obj_09)
(pred_4 obj_10 obj_14)
(pred_2 obj_10 obj_11)
(pred_2 obj_10 obj_01)
(pred_3 obj_05 obj_13)
(pred_3 obj_06 obj_14)
(pred_3 obj_08 obj_07)
(pred_3 obj_12 obj_02)
)
(:goal
(and
(pred_3 obj_05 obj_07)
(pred_3 obj_06 obj_14)
(pred_3 obj_08 obj_02)
(pred_3 obj_12 obj_07)
)
)

(:constraints
  (and
    (always (not (and (pred_4 obj_03 obj_07) (pred_4 obj_10 obj_07))))
  )
)
)