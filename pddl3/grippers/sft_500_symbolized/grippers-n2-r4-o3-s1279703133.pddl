(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_11 obj_06 - type_1
obj_04 obj_13 obj_01 obj_10 - type_2
obj_02 obj_03 obj_07 obj_12 - type_3
obj_09 obj_08 obj_05 - object)
(:init
(pred_1 obj_11 obj_07)
(pred_3 obj_11 obj_04)
(pred_3 obj_11 obj_13)
(pred_1 obj_06 obj_12)
(pred_3 obj_06 obj_01)
(pred_3 obj_06 obj_10)
(pred_2 obj_09 obj_07)
(pred_2 obj_08 obj_03)
(pred_2 obj_05 obj_02)
)
(:goal
(and
(pred_2 obj_09 obj_12)
(pred_2 obj_08 obj_03)
(pred_2 obj_05 obj_12)
)
)

(:constraints
  (and
    (always (not (and (pred_1 obj_11 obj_12) (pred_1 obj_06 obj_12))))
  )
)
)