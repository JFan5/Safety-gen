(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_13 obj_09 - type_3
obj_07 obj_02 obj_10 obj_08 - type_1
obj_11 obj_01 obj_03 obj_05 - type_2
obj_12 obj_04 obj_06 - object)
(:init
(pred_2 obj_13 obj_01)
(pred_1 obj_13 obj_07)
(pred_1 obj_13 obj_02)
(pred_2 obj_09 obj_05)
(pred_1 obj_09 obj_10)
(pred_1 obj_09 obj_08)
(pred_4 obj_12 obj_03)
(pred_4 obj_04 obj_03)
(pred_4 obj_06 obj_01)
)
(:goal
(and
(pred_4 obj_12 obj_11)
(pred_4 obj_04 obj_05)
(pred_4 obj_06 obj_05)
)
)

(:constraints
  (and
    (always (not (and (pred_2 obj_13 obj_05) (pred_2 obj_09 obj_05))))
  )
)
)