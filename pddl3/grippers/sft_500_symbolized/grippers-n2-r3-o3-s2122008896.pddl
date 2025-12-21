(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_11 obj_01 - type_1
obj_02 obj_12 obj_09 obj_06 - type_2
obj_05 obj_07 obj_04 - type_3
obj_03 obj_10 obj_08 - object)
(:init
(pred_1 obj_11 obj_07)
(pred_3 obj_11 obj_02)
(pred_3 obj_11 obj_12)
(pred_1 obj_01 obj_04)
(pred_3 obj_01 obj_09)
(pred_3 obj_01 obj_06)
(pred_2 obj_03 obj_07)
(pred_2 obj_10 obj_05)
(pred_2 obj_08 obj_07)
)
(:goal
(and
(pred_2 obj_03 obj_05)
(pred_2 obj_10 obj_04)
(pred_2 obj_08 obj_05)
)
)

(:constraints
  (and
    (always (not (and (pred_1 obj_11 obj_05) (pred_1 obj_01 obj_05))))
  )
)
)