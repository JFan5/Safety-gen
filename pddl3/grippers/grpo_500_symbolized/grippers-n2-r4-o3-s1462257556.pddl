(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_08 obj_09 - type_1
obj_11 obj_13 obj_07 obj_02 - type_3
obj_03 obj_10 obj_12 obj_04 - type_2
obj_05 obj_01 obj_06 - object)
(:init
(pred_4 obj_08 obj_12)
(pred_2 obj_08 obj_11)
(pred_2 obj_08 obj_13)
(pred_4 obj_09 obj_03)
(pred_2 obj_09 obj_07)
(pred_2 obj_09 obj_02)
(pred_3 obj_05 obj_12)
(pred_3 obj_01 obj_12)
(pred_3 obj_06 obj_03)
)
(:goal
(and
(pred_3 obj_05 obj_04)
(pred_3 obj_01 obj_10)
(pred_3 obj_06 obj_10)
)
)

(:constraints
  (and
    (always (not (and (pred_4 obj_08 obj_10) (pred_4 obj_09 obj_10))))
  )
)
)