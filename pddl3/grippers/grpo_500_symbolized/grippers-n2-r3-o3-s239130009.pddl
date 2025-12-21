(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_09 obj_01 - type_1
obj_04 obj_05 obj_02 obj_06 - type_3
obj_11 obj_12 obj_07 - type_2
obj_10 obj_08 obj_03 - object)
(:init
(pred_4 obj_09 obj_12)
(pred_2 obj_09 obj_04)
(pred_2 obj_09 obj_05)
(pred_4 obj_01 obj_11)
(pred_2 obj_01 obj_02)
(pred_2 obj_01 obj_06)
(pred_3 obj_10 obj_11)
(pred_3 obj_08 obj_12)
(pred_3 obj_03 obj_11)
)
(:goal
(and
(pred_3 obj_10 obj_12)
(pred_3 obj_08 obj_12)
(pred_3 obj_03 obj_12)
)
)

(:constraints
  (and
    (always (not (and (pred_4 obj_09 obj_12) (pred_4 obj_01 obj_12))))
  )
)
)