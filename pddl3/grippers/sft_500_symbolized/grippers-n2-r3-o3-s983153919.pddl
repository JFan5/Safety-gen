(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_08 obj_03 - type_2
obj_05 obj_11 obj_04 obj_12 - type_3
obj_10 obj_07 obj_06 - type_1
obj_02 obj_09 obj_01 - object)
(:init
(pred_1 obj_08 obj_07)
(pred_4 obj_08 obj_05)
(pred_4 obj_08 obj_11)
(pred_1 obj_03 obj_10)
(pred_4 obj_03 obj_04)
(pred_4 obj_03 obj_12)
(pred_3 obj_02 obj_07)
(pred_3 obj_09 obj_06)
(pred_3 obj_01 obj_10)
)
(:goal
(and
(pred_3 obj_02 obj_10)
(pred_3 obj_09 obj_07)
(pred_3 obj_01 obj_07)
)
)

(:constraints
  (and
    (always (not (and (pred_1 obj_08 obj_07) (pred_1 obj_03 obj_07))))
  )
)
)