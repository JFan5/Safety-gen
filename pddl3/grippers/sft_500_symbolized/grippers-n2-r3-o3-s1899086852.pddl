(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_12 obj_03 - type_2
obj_09 obj_02 obj_04 obj_10 - type_1
obj_11 obj_08 obj_05 - type_3
obj_07 obj_06 obj_01 - object)
(:init
(pred_1 obj_12 obj_05)
(pred_3 obj_12 obj_09)
(pred_3 obj_12 obj_02)
(pred_1 obj_03 obj_08)
(pred_3 obj_03 obj_04)
(pred_3 obj_03 obj_10)
(pred_2 obj_07 obj_11)
(pred_2 obj_06 obj_11)
(pred_2 obj_01 obj_08)
)
(:goal
(and
(pred_2 obj_07 obj_05)
(pred_2 obj_06 obj_08)
(pred_2 obj_01 obj_05)
)
)

(:constraints
  (and
    (always (not (and (pred_1 obj_12 obj_05) (pred_1 obj_03 obj_05))))
  )
)
)