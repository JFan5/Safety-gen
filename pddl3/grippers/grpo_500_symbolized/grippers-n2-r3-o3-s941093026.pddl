(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_09 obj_03 - type_1
obj_02 obj_10 obj_12 obj_04 - type_3
obj_01 obj_11 obj_08 - type_2
obj_07 obj_05 obj_06 - object)
(:init
(pred_4 obj_09 obj_01)
(pred_2 obj_09 obj_02)
(pred_2 obj_09 obj_10)
(pred_4 obj_03 obj_11)
(pred_2 obj_03 obj_12)
(pred_2 obj_03 obj_04)
(pred_3 obj_07 obj_01)
(pred_3 obj_05 obj_01)
(pred_3 obj_06 obj_08)
)
(:goal
(and
(pred_3 obj_07 obj_08)
(pred_3 obj_05 obj_11)
(pred_3 obj_06 obj_11)
)
)

(:constraints
  (and
    (always (not (and (pred_4 obj_09 obj_11) (pred_4 obj_03 obj_11))))
    (always (not (and (pred_4 obj_09 obj_08) (pred_4 obj_03 obj_08))))
  )
)
)