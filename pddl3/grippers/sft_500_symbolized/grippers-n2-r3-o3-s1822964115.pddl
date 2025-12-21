(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_08 obj_10 - type_1
obj_01 obj_02 obj_12 obj_05 - type_2
obj_11 obj_03 obj_07 - type_3
obj_06 obj_04 obj_09 - object)
(:init
(pred_1 obj_08 obj_11)
(pred_3 obj_08 obj_01)
(pred_3 obj_08 obj_02)
(pred_1 obj_10 obj_07)
(pred_3 obj_10 obj_12)
(pred_3 obj_10 obj_05)
(pred_2 obj_06 obj_03)
(pred_2 obj_04 obj_03)
(pred_2 obj_09 obj_03)
)
(:goal
(and
(pred_2 obj_06 obj_03)
(pred_2 obj_04 obj_07)
(pred_2 obj_09 obj_07)
)
)

(:constraints
  (and
    (always (not (and (pred_1 obj_08 obj_07) (pred_1 obj_10 obj_07))))
  )
)
)