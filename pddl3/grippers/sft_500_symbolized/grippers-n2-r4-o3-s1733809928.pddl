(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_11 obj_09 - type_1
obj_04 obj_03 obj_07 obj_02 - type_2
obj_13 obj_05 obj_10 obj_12 - type_3
obj_06 obj_08 obj_01 - object)
(:init
(pred_1 obj_11 obj_05)
(pred_2 obj_11 obj_04)
(pred_2 obj_11 obj_03)
(pred_1 obj_09 obj_10)
(pred_2 obj_09 obj_07)
(pred_2 obj_09 obj_02)
(pred_4 obj_06 obj_10)
(pred_4 obj_08 obj_13)
(pred_4 obj_01 obj_10)
)
(:goal
(and
(pred_4 obj_06 obj_05)
(pred_4 obj_08 obj_13)
(pred_4 obj_01 obj_12)
)
)

(:constraints
  (and
    (always (not (and (pred_1 obj_11 obj_05) (pred_1 obj_09 obj_05))))
  )
)
)