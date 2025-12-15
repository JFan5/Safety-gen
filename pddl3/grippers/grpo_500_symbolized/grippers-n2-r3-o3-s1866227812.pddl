(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_06 obj_09 - type_1
obj_10 obj_05 obj_11 obj_02 - type_3
obj_03 obj_01 obj_12 - type_2
obj_07 obj_04 obj_08 - object)
(:init
(pred_3 obj_06 obj_01)
(pred_4 obj_06 obj_10)
(pred_4 obj_06 obj_05)
(pred_3 obj_09 obj_12)
(pred_4 obj_09 obj_11)
(pred_4 obj_09 obj_02)
(pred_2 obj_07 obj_12)
(pred_2 obj_04 obj_01)
(pred_2 obj_08 obj_12)
)
(:goal
(and
(pred_2 obj_07 obj_01)
(pred_2 obj_04 obj_12)
(pred_2 obj_08 obj_03)
)
)

(:constraints
  (and
    (always (not (and (pred_3 obj_06 obj_12) (pred_3 obj_09 obj_12))))
  )
)
)