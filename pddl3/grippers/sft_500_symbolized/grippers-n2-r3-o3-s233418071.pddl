(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_09 obj_07 - type_2
obj_12 obj_10 obj_01 obj_05 - type_3
obj_11 obj_06 obj_04 - type_1
obj_08 obj_03 obj_02 - object)
(:init
(pred_3 obj_09 obj_04)
(pred_4 obj_09 obj_12)
(pred_4 obj_09 obj_10)
(pred_3 obj_07 obj_11)
(pred_4 obj_07 obj_01)
(pred_4 obj_07 obj_05)
(pred_2 obj_08 obj_04)
(pred_2 obj_03 obj_11)
(pred_2 obj_02 obj_06)
)
(:goal
(and
(pred_2 obj_08 obj_11)
(pred_2 obj_03 obj_04)
(pred_2 obj_02 obj_06)
)
)

(:constraints
  (and
    (always (not (and (pred_3 obj_09 obj_04) (pred_3 obj_07 obj_04))))
  )
)
)