(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_11 obj_02 - type_1
obj_06 obj_05 obj_09 obj_04 - type_3
obj_07 obj_12 obj_03 - type_2
obj_08 obj_01 obj_10 - object)
(:init
(pred_3 obj_11 obj_07)
(pred_4 obj_11 obj_06)
(pred_4 obj_11 obj_05)
(pred_3 obj_02 obj_03)
(pred_4 obj_02 obj_09)
(pred_4 obj_02 obj_04)
(pred_2 obj_08 obj_12)
(pred_2 obj_01 obj_03)
(pred_2 obj_10 obj_12)
)
(:goal
(and
(pred_2 obj_08 obj_07)
(pred_2 obj_01 obj_07)
(pred_2 obj_10 obj_12)
)
)

(:constraints
  (and
    (always (not (and (pred_3 obj_11 obj_07) (pred_3 obj_02 obj_07))))
  )
)
)